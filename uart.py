import serial
ser = serial.Serial('com3',9600)
if ser.is_open:
    print("打开串口成功！")
    while True:
        print("等待接收温度数据...")
        temperature = str(ser.read(size=2).hex())
        print("当前温度为:", temperature[0:2], ".", temperature[-1], "℃")
        print("发送音符...")
        ser.write("\x00\x08\x0c\x09".encode("utf-8"))
        ser.write("\x00\x08\x0c\x09".encode("utf-8"))
        ser.write("\x00\x08\x0a\x0b\x0c\x0d\x0c".encode("utf-8"))
        ser.write("\x00\x08\x0a\x0b\x0c\x0d\x0c".encode("utf-8"))
        ser.write("\x00\x0c\x0b\x0a".encode("utf-8"))
        ser.write("\x00\x0c\x0b\x0a".encode("utf-8"))
        ser.write("\x00\x08\x0a\x09\x08".encode("utf-8"))
        ser.write("\x00\x08\x0a\x09\x08".encode("utf-8"))
        ser.write("\x1f".encode("utf-8"))
else:
    print("打开串口失败！")