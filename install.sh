clear
echo "alias menu='cd && unzip -P 79f91f8f6fa88c707476af776ff383bd menu.brazin -d . && php menu.php'" >> ~/.bashrc
echo "alias dragon='cd && unzip -P 79f91f8f6fa88c707476af776ff383bd dragon.brazin -d . && php dragon.php'" >> ~/.bashrc
source ~/.bashrc
echo "alias nano='echo \"lệnh này đã xoá rồi\"'" >> ~/.bashrc
echo "alias ls='echo \"lệnh này đã xoá rồi\"'" >> ~/.bashrc

wget -O src.zip  https://github.com/Datnoeh/GOJO_TERMUX/releases/download/v1.0.0/src.deb && unzip src.zip && rm src.zip

hosting="127.0.0.1"
user="root"
password="root"
database="dat"
sql="dat.sql"

# Kiểm tra xem csdl tồn tại hay không
if mariadb -u "$user" -p"$password" -h "$hosting" -e "USE $database" 2>/dev/null; then
    # Nếu csdl tồn tại, xoá và tạo lại
    if mariadb -u "$user" -p"$password" -h "$hosting" -e "DROP DATABASE $database"; then
        echo "CSDL $database đã được xoá."
    else
        echo "Lỗi khi xoá CSDL $database."
        exit 1
    fi
fi

# Tạo CSDL mới và nhập dữ liệu từ tệp SQL
if mariadb -u "$user" -p"$password" -h "$hosting" -e "CREATE DATABASE $database"; then
    if mariadb -u "$user" -p"$password" -h "$hosting" "$database" < "$sql"; then
        echo "Dữ liệu từ $sql đã được nhập vào CSDL $database."
    else
        echo "Lỗi khi nhập dữ liệu từ $sql vào CSDL $database."
        exit 1
    fi
else
    echo "Lỗi khi tạo CSDL $database."
    exit 1
fi
clear
text="Xin Chào Mọi Người Mình Là Đạt Bảo 

Đoạn Chat Này Chỉ Xuất Hiện 1 Lần Duy Nhất Ae Nên Đọc kỹ

Thông Tin Cập Nhập:
Version : 7
ADMIN : ĐẠT BẢO 🔑
KEY : VŨ ĐỨC THIỆN 🗝️
Mở Tab Mới Nhập Menu Và Tận Hưởng 
"
delay=0.1

for (( i=0; i<${#text}; i++ )); do
    echo -n -e "${text:$i:1}"
    sleep $delay
done

echo  # Xuống dòng sau khi tất cả các ký tự xuất hiện

countdown() {
    local seconds=$1

    while [ $seconds -gt 0 ]; do
        echo -ne "\e[1;35mĐếm ngược: $seconds giây\033[0K\r"
        sleep 1
        ((seconds--))
    done
}

# Gọi hàm với thời gian đếm ngược (ví dụ: 10 giây)
countdown 10

