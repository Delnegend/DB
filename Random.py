import random

class Create:
    __FamilyName = ["Nguyễn", "Trần", "Lê", "Phạm", "Hoàng", "Phan", "Vũ", "Đặng", "Bùi", "Đỗ", "Hồ", "Ngô", "Dương", "Lý"]
    __FamilyNameWeight = [48.3, 12.1, 9.5, 7, 5.1, 4.5, 3.9, 2.1, 2, 1.4, 1.3, 1.3, 1, 0.5]
    __Name = ["Ái", "An", "Anh", "Bảo", "Công", "Đức", "Đình", "Duy", "Gia", "Hải", "Hiếu", "Hoài", "Hoàng", "Huy", "Khải", "Khánh", "Lan", "Mai", "Mạnh", "Minh", "Ngọc", "Nhật", "Như", "Quỳnh", "Thảo", "Thanh", "Thành", "Thiện", "Thu", "Thuỷ", "Trâm", "Tuấn", "Vân", "Vị", "Vỹ", "Xuân", "Yên", "Yến"]
    __takenID = []
    def __getFamilyName(self):
        return random.choices(self.__FamilyName, self.__FamilyNameWeight)[0]
    def name(self) -> str:
        name = self.__Name.copy()
        middleName = random.choice(name)
        name.remove(middleName)
        lastName = random.choice(name)
        return self.__getFamilyName() + " " + middleName + " " + lastName
    def DOB(self) -> str:
        return str(random.randint(1, 28)) + "-" + str(random.randint(1, 12)) + "-2003"
    def Gender(self) -> str:
        return random.choice(["M", "F"])
    def Address(self) -> str:
        return str(random.randint(1, 300)) + " " + random.choice(["Hà Nội", "Hải Phòng", "Đà Nẵng", "Hồ Chí Minh", "Cần Thơ", "Bắc Ninh", "Hải Dương", "Hưng Yên", "Hà Nam", "Nam Định", "Thái Bình", "Ninh Bình", "Hà Tĩnh", "Quảng Bình", "Quảng Trị", "Thừa Thiên Huế", "Đà Nẵng", "Quảng Nam", "Quảng Ngãi", "Bình Định", "Phú Yên", "Khánh Hòa", "Ninh Thuận"])
    def student(self):
        return f'("{self.name()}", "{self.DOB()}", "{self.Address()}", "{self.Gender()}", "2021"),'

def main():
    create = Create()
    amount = int(input("Amount: "))
    for i in range(amount):
        print(str(create))

if __name__ == "__main__":
    main()
