import requests
from bs4 import BeautifulSoup

url = 'https://ngocrongden.net/'

# Kết nối đến URL
response = requests.get(url)

# Kiểm tra trạng thái kết nối
if response.status_code == 200:
    # Sử dụng BeautifulSoup để phân tích HTML
    soup = BeautifulSoup(response.text, 'html.parser')

    # Trích xuất thông tin cần từ HTML
    spine_data = soup.find('div', {'class': 'spine-class'})
    animation_data = soup.find('div', {'class': 'animation-class'})
    images_data = soup.find_all('img')
    fonts_data = soup.find_all('link', {'rel': 'stylesheet'})
    mp3_data = soup.find_all('audio')
    tif_data = soup.find_all('tif-tag')
    gif_data = soup.find_all('gif-tag')

    # Tiếp tục xử lý và unpack dữ liệu theo yêu cầu của bạn
    # (Sử dụng thư viện cụ thể cho từng loại dữ liệu)

else:
    print(f"Failed to connect to {url}. Status code: {response.status_code}")
    