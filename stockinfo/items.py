# Define here the models for your scraped items
#
# See documentation in:
# https://docs.scrapy.org/en/latest/topics/items.html

import scrapy


class StockinfoItem(scrapy.Item):
    # define the fields for your item here like:
    symbol = scrapy.Field()
    short_name = scrapy.Field()
    pb = scrapy.Field()
    pe = scrapy.Field()
    pe_ttm = scrapy.Field()
    eps = scrapy.Field()
    eps_ttm = scrapy.Field()
    bps = scrapy.Field()

    pass
