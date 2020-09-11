# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://docs.scrapy.org/en/latest/topics/item-pipeline.html


# useful for handling different item types with a single interface
from itemadapter import ItemAdapter

import stockinfo.settings as settings
import pymysql


class MysqlWriterPipeline:
    def __init__(self):
        # 打开数据库连接
        self.db = pymysql.connect(host=settings.DB_SERVER_NAME, user=settings.DB_SERVER_USER_NAME,
                                  password=settings.DB_SERVER_PASSWORD, db=settings.DB_NAME, charset="utf8")
        sql = "truncate info"

        # 使用cursor()方法获取操作游标
        cursor = self.db.cursor()
        # 执行sql语句
        cursor.execute(sql)
        # 提交到数据库执行
        self.db.commit()

    def process_item(self, item, spider):
        # 使用cursor()方法获取操作游标
        cursor = self.db.cursor()

        # SQL 插入语句
        sql = """ INSERT INTO `stock`.`info` (`symbol`, `short_name`, `pb`, `pe`, `pe_ttm`, `eps`,  `eps_ttm`, `bps`)
                    VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"""

        # 执行sql语句
        # 执行sql语句
        cursor.execute(sql, (item["symbol"], item["short_name"], item["pb"], item["pe"], item["pe_ttm"],
                             item["eps"], item["eps_ttm"], item["bps"]))
        # 提交到数据库执行
        self.db.commit()

        return item

    def close_spider(self, spider):
        # 关闭数据库连接
        self.db.close()
