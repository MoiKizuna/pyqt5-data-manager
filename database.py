from PyQt5.QtWidgets import QApplication, QMessageBox
from PyQt5.QtSql import QSqlDatabase, QSqlQuery

class DatabaseManager:
    def __init__(self, database_name):
        self.db = QSqlDatabase.addDatabase('QSQLITE')
        self.db.setDatabaseName(database_name)

    def open_connection(self):
        if not self.db.open():
            QMessageBox.critical(None, 'Database Error', self.db.lastError().text())
            return False
        return True

    def close_connection(self):
        self.db.close()

    def execute_query(self, query):
        q = QSqlQuery()
        if not q.exec_(query):
            QMessageBox.critical(None, 'Database Error', q.lastError().text())
            return False
        return True

if __name__ == '__main__':
    app = QApplication([])
    db_manager = DatabaseManager('data/hrmasterdb.db')  # 替换成你的 SQLite 数据库文件路径
    if db_manager.open_connection():
        # 测试一个查询
        query = "SELECT * FROM department;"
        if db_manager.execute_query(query):
            print("Query executed successfully")
        db_manager.close_connection()
