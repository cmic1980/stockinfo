import scrapy
import json
import tushare as ts
import stockinfo.settings as settings
from stockinfo.items import StockinfoItem

class SpStockInfo(scrapy.Spider):
    name = "sp_stockinfo"
    allowed_domains = ["gw.datayes.com"]
    start_urls = ["https://r.datayes.com/"]
    root_url = "https://gw.datayes.com/rrp_adventure/web/stock/info?&ticker={}"

    def __init__(self):
        pass

    def parse(self, response):
        # 获取 股票列表
        ts.set_token(settings.TUSHARE_TOKEN)
        pro = ts.pro_api()
        data = pro.stock_basic(exchange='', list_status='L', fields='symbol')
        for symbol in data["symbol"]:
            cookies = {'cloud-sso-token': settings.CLOUD_SSO_TOKEN}
            url = self.root_url.format(symbol)
            yield scrapy.Request(url, cookies=cookies, callback=self.parse_ticker, cb_kwargs={"symbol": symbol})

    def parse_ticker(self, response, symbol):
        body = response.body.decode('utf-8')
        json_object = json.loads(body)
        data = json_object["data"]

        item = StockinfoItem()
        item["symbol"] = data["ticker"]
        item["short_name"] = data["shortNM"]
        item["pb"] = data["pb"]
        item["pe"] = data["pe"]
        item["pe_ttm"] = data["pettm"]
        item["eps"] = data["eps"]
        item["eps_ttm"] = data["epsttm"]
        item["bps"] = data["bps"]
        yield item