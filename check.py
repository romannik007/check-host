import socket
import configparser
cp = configparser.ConfigParser()
check_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
cp.read("./resources.conf")
url = cp.get("resources", "check_url")
port = cp.get("resources", "check_port")
print(url, port)
check_socket.settimeout(5)
result_of_check = check_socket.connect_ex((url,int(port)))

check_socket.close()

if result_of_check == 0:
   print("Port is open")
else:
   send_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
   send_socket.settimeout(5)
   send_url = cp.get("send", "send_url")
   send_port = cp.get("send", "send_port")
   send_line = '{"failed"' + ':' + '"' + check_url + ':' + check_port + '"' +'}'
   print(send_line)
   send_socket.connect((send_url,int(send_port)))
   send_socket.send(bytes(send_line, encoding = 'UTF-8'))
   print("Port is not open")
   send_socket.close()




