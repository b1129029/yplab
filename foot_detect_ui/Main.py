import os
from page2 import Ui_Form
from PyQt5 import QtGui, QtWidgets, QtCore
from PyQt5.QtWidgets import QMessageBox , QSpacerItem, QSizePolicy, QApplication, QHBoxLayout, QMainWindow, QWidget, QStackedWidget, QVBoxLayout, QPushButton, QLabel, QLineEdit, QFrame

class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("腳部水腫觀測系統")
        self.resize(1600, 900)

        # 創建堆疊佈局
        self.stacked_widget = QStackedWidget()
        self.setCentralWidget(self.stacked_widget)

        # 初始化不同頁面
        self.login_page = LoginPage(self)
        self.search_page = SearchPage(self)
        self.detail_page = DetailPage(self)

        # 添加頁面到堆疊佈局
        self.stacked_widget.addWidget(self.login_page)
        self.stacked_widget.addWidget(self.search_page)
        self.stacked_widget.addWidget(self.detail_page)

        # 設置初始頁面為登錄頁面
        self.stacked_widget.setCurrentWidget(self.login_page)

class LoginPage(QWidget):
    def __init__(self, parent):
        super().__init__()
        self.parent = parent

        # 設定背景圖片
        base_dir = os.path.dirname(os.path.abspath(__file__))
        img_dir = os.path.join(base_dir, 'source', 'img')
        background_image = os.path.join(img_dir, 'background.gif')

        # 背景圖片顯示
        self.background_label = QLabel(self)
        self.background_label.setGeometry(0, 0, 1600, 900)  # 設置為全窗口尺寸
        self.movie = QtGui.QMovie(background_image)
        self.background_label.setMovie(self.movie)
        self.background_label.setScaledContents(True)
        self.movie.start()

        # 創建主佈局
        main_layout = QVBoxLayout()

        # 設置灰色背景框
        self.gray_background = QFrame(self)
        self.gray_background.setStyleSheet("background-color: white; border-radius: 10px;")
        self.gray_background.setFixedSize(390, 260)  # 設置固定大小

        # 創建灰色背景框內部佈局
        gray_layout = QVBoxLayout()
        gray_layout.setContentsMargins(20, 20, 20, 20)  # 設置邊距
        gray_layout.addWidget(self.gray_background)
        gray_layout.setAlignment(QtCore.Qt.AlignCenter)  # 垂直方向居中

        # 創建灰色框架內部佈局
        form_layout = QVBoxLayout()
        form_layout.setContentsMargins(10, 10, 10, 10)  # 設置邊距

        self.username_label = QLabel("用戶名:")
        self.username_label.setStyleSheet("font-size: 20px;")
        self.username_input = QLineEdit(self)
        self.username_input.setStyleSheet("""
            QLineEdit {
                border: 3px solid gray;
                border-radius: 10px;
                padding: 5px;
            }
        """)
        form_layout.addWidget(self.username_label)
        form_layout.addWidget(self.username_input)

        self.password_label = QLabel("密碼:")
        self.password_label.setStyleSheet("font-size: 20px;")
        self.password_input = QLineEdit(self)
        self.password_input.setStyleSheet("""
            QLineEdit {
                border: 3px solid gray;
                border-radius: 10px;
                padding: 5px;
            }
        """)
        form_layout.addWidget(self.password_label)
        form_layout.addWidget(self.password_input)

        form_layout.addSpacing(30)

        button_layout = QVBoxLayout()
        button_layout.setContentsMargins(130, 0, 130, 0)
        # 創建登入按鈕
        login_button = QPushButton("登入", self)
        login_button.setStyleSheet("""
            QPushButton {
                background-color: gray;
                border: none;
                border-radius: 10px;
                color: white;
                padding: 8px;
                font-size: 20px;
            }
            QPushButton:hover {
                background-color: darkgray;
            }
        """)
        login_button.clicked.connect(self.handle_login)
        button_layout.addWidget(login_button)

        # 將按鈕添加到表單佈局中
        form_layout.addLayout(button_layout)

        # 將表單佈局添加到灰色背景框
        self.gray_background.setLayout(form_layout)

        # 將灰色背景框佈局添加到主佈局
        main_layout.addItem(QSpacerItem(0, 0, QSizePolicy.Expanding, QSizePolicy.Expanding))  # 添加上部間隔
        main_layout.addLayout(gray_layout)  # 添加灰色背景框佈局
        main_layout.addItem(QSpacerItem(0, 0, QSizePolicy.Expanding, QSizePolicy.Expanding))  # 添加下部間隔

        # 設置主佈局
        self.setLayout(main_layout)

    def handle_login(self):
        # 簡單模擬登錄驗證
        if self.username_input.text() == "123" and self.password_input.text() == "123":
            self.parent.stacked_widget.setCurrentWidget(self.parent.search_page)
        else:
            # 帳密錯誤彈出提示框
            msg_box = QMessageBox(self)
            msg_box.setWindowTitle("帳號或密碼錯誤")
            msg_box.setIcon(QMessageBox.Warning)  # 使用警告圖標
            msg_box.setText("帳號或密碼錯誤，請重新輸入。")
            msg_box.setStandardButtons(QMessageBox.Ok)
            msg_box.button(QMessageBox.Ok).setText("確定")
            msg_box.exec_()

class SearchPage(QWidget):
    def __init__(self, parent):
        super().__init__()
        self.parent = parent
        self.ui = Ui_Form()
        self.ui.setupUi(self)

        # 初始化行索引
        self.row = None

        # 連結雙擊 tableView 行事件
        self.ui.tableView.doubleClicked.connect(self.handle_table_double_click)
    
    def show_detail(self):
        # 模擬選擇了一個資料並切換到詳細資料頁面
        self.parent.stacked_widget.setCurrentWidget(self.parent.detail_page)
    
    def handle_table_double_click(self, index):
        # 處理雙擊事件的邏輯
        self.row = index.row()  # 將雙擊的行索引存儲到 self.row
        print(f"雙擊了第 {self.row + 1} 行")  # 這裡可以加入處理雙擊事件的具體邏輯
        self.show_detail()
    

class DetailPage(QWidget):
    def __init__(self, parent):
        super().__init__()
        self.parent = parent
        layout = QVBoxLayout()

        detail_label = QLabel("這裡是詳細資料頁面", self)
        layout.addWidget(detail_label)

        back_button = QPushButton("上一頁", self)
        back_button.clicked.connect(self.go_back)
        layout.addWidget(back_button)

        self.setLayout(layout)

    def go_back(self):
        self.parent.stacked_widget.setCurrentWidget(self.parent.search_page)

if __name__ == "__main__":
    app = QApplication([])
    window = MainWindow()
    window.show()
    app.exec_()
 