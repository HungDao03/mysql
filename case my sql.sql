CREATE DATABASE Fake_Hotell;
USE Fake_Hotell;
CREATE TABLE User (
UserId INT PRIMARY KEY,
UserEmail VARCHAR(250) NOT NULL UNIQUE,
UserPassword VARCHAR(250) NOT NULL,
UserName VARCHAR(250) NOT NULL,
UserBirthDate DATE NOT NULL,
UserPhoneNumber VARCHAR(15) NOT NULL,
UserAvatarLink VARCHAR(250),
UserRole ENUM('admin', 'customer')
);
CREATE TABLE RoomType (
RoomTypeId INT PRIMARY KEY AUTO_INCREMENT,
RoomTypeName VARCHAR(30) NOT NULL
);
INSERT INTO RoomType(RoomTypeName) VALUES ('Đơn', 'Đôi');
-- tách riêng để có thể thêm được phân khúc khác


CREATE TABLE Room (
RoomId INT PRIMARY KEY AUTO_INCREMENT,
RoomTypeId INT NOT NULL,
RoomOwner INT NOT NULL,
RoomCode VARCHAR(50) NOT NULL,
RoomLocation VARCHAR(250) NOT NULL,
RoomDescription TEXT,
RoomImgLink VARCHAR(250),
RoomPrice DOUBLE NOT NULL,
RoomStatus ENUM('available', 'rented'),
RoomCreateDate TIMESTAMP NOT NULL,
RoomUpdateDate TIMESTAMP NOT NULL,
FOREIGN KEY (RoomOwner) REFERENCES User(UserId),
FOREIGN KEY (RoomTypeId) REFERENCES RoomType(RoomTypeId)
);

CREATE TABLE Bookingver3 (
                         BookingId INT PRIMARY KEY AUTO_INCREMENT,
                         CustomerName VARCHAR(244),
#      ----------------------------------------------------------          
#                thong tin lay tu bảng room, kỳ vọng nếu bảng room thay đổi thông tin thì những thông tin này trong bảng booking cũng thay đổi theo
                         RoomTypeId INT NOT NULL, 
                         UserId INT NOT NULL,
                        RoomId INT,
                        RoomLocation VARCHAR(250),
                         RoomDescription TEXT,
                         RoomImgLink VARCHAR(250),
                         RoomPrice DOUBLE NOT NULL,
                         RoomStatus ENUM('available', 'rented'),
#     -------------------------------------------------
                         BookingStartDate TIMESTAMP ,
                         BookingEndDate TIMESTAMP ,
                         BookingTotalPrice DOUBLE,
                         FOREIGN KEY (RoomId) REFERENCES Room(RoomId)
);


INSERT INTO fake_hotell.bookingver3 
(BookingId, CustomerName, RoomTypeId, RoomId, UserId, RoomLocation, RoomDescription, RoomImgLink, RoomPrice, RoomStatus, BookingStartDate, BookingEndDate, BookingTotalPrice)
VALUES  
(16, 'Nguyễn Trung Kiên', 1, 1, 2, '123 Main Street', 'Phòng đẹp, thoáng mát, gần trung tâm', 'https://ebm.com.vn/wp-content/uploads/2021/04/e1102df59b990de65bc20bd381f0e6e5.jpg', 3000000, 'rented', '2024-12-11 08:08:00', '2024-12-21 08:08:00', 15000000),
(17, 'DDxvxv', 2, 2, 3, '456 Second Street', 'Phòng rộng rãi, đầy đủ tiện nghi', 'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2024/07/hinh-anh-ngoi-nha-2.jpg', 5000000, 'rented', '2024-11-28 19:35:00', '2025-01-03 19:35:00', 25000000);



CREATE TABLE Income (
IncomeId INT PRIMARY KEY AUTO_INCREMENT,
UserId INT NOT NULL,
IncomeMonth INT NOT NULL,
IncomeYear INT NOT NULL,
IncomeTotal DOUBLE NOT NULL DEFAULT 0,
IncomeCreateTime TIMESTAMP NOT NULL,
IncomeUpdateTime TIMESTAMP NOT NULL,
FOREIGN KEY (UserId) REFERENCES User(UserId)
);

insert into fake_hotell.income (IncomeId, UserId, IncomeMonth, IncomeYear, IncomeTotal, IncomeCreateTime, IncomeUpdateTime)
values  (1, 2, 12, 2024, 300000, '2024-12-06 14:31:11', '2024-12-06 14:31:11'),
        (2, 3, 12, 2024, 500000, '2024-12-06 14:31:11', '2024-12-06 14:31:11'),
        (3, 4, 12, 2024, 1000000, '2024-12-06 14:31:11', '2024-12-06 14:31:11'),
        (4, 5, 12, 2024, 700000, '2024-12-06 14:31:11', '2024-12-06 14:31:11'),
        (5, 5, 11, 2024, 0, '2024-12-06 14:31:11', '2024-12-06 14:31:11');


INSERT INTO Room 
(RoomId, RoomTypeId, RoomOwner, RoomCode, RoomLocation, RoomDescription, RoomImgLink, RoomPrice, RoomStatus, RoomCreateDate, RoomUpdateDate)
VALUES
(1, 1, 2, 'R001', '123 Main Street', 'Phòng đẹp, thoáng mát, gần trung tâm', 'https://ebm.com.vn/wp-content/uploads/2021/04/e1102df59b990de65bc20bd381f0e6e5.jpg', 3000000, 'available', '2024-12-01 08:00:00', '2024-12-05 08:00:00'),
(2, 2, 3, 'R002', '456 Second Street', 'Phòng rộng rãi, đầy đủ tiện nghi', 'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2024/07/hinh-anh-ngoi-nha-2.jpg', 5000000, 'rented', '2024-11-15 09:30:00', '2024-12-01 09:30:00'),
(3, 3, 2, 'R003', '789 Third Street', 'Phòng giá rẻ, phù hợp sinh viên', 'https://smarthome.worldtech.vn/wp-content/uploads/2017/10/cac-mau-nha-vuon-dep-1024x716.jpg', 2000000, 'available', '2024-11-10 10:00:00', '2024-11-20 10:00:00'),
(4, 1, 3, 'R004', '321 Fourth Street', 'Phòng đầy đủ nội thất, gần công viên', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEg4Dyok79pBarE43F6FPiYaa8EG-JYOZOx9U27ut1wQMCiw3kTjcvOmKtN6VLCWoXY3g8_ITUJQLS8d5mTpyKr-RpFY1WCBj9yS-WqncFvVLEFdFA6TSxIuHqUL5HAqnooCkC98De0WGUUJ/s1600/can-ho-phuc-yen-2_tien-do1.jpg', 4500000, 'rented', '2024-11-01 15:30:00', '2024-12-03 15:30:00'),
(5, 2, 2, 'R005', '654 Fifth Street', 'Phòng giá rẻ, tiện ích cơ bản', 'https://xaydungnhauytin.com/uploads/mau-nha-dep/06-2023/mau-thiet-ke-nha-cap-4-mai-thai-dep-1.jpg', 2500000, 'available', '2024-10-25 12:00:00', '2024-11-15 12:00:00');


insert into fake_hotell.roomtype (RoomTypeId, RoomTypeName)
values  (1, 'Đơn'),
        (2, 'Đôi'),
        (3, 'VIP');


insert into fake_hotell.user (UserId, UserEmail, UserPassword, UserName, UserBirthDate, UserPhoneNumber, UserAvatarLink, UserRole)
values  (1, 'admin@example.com', '0192023a7bbd73250516f069df18b500', 'Admin User', '1990-01-01', '0123456789', null, 'admin'),
        (2, 'customer1@example.com', '7ea559226daef4cd0ab0c5f4e9feee9d', 'Customer One', '1995-06-15', '0987654321', null, 'customer'),
        (3, 'customer2@example.com', '62a924537af0a62088215c98b0a4ee8c', 'Customer Two', '2000-03-10', '0971234567', null, 'customer'),
        (4, 'customer3@example.com', '819b0643d6b89dc9b579fdfc9094f28e', 'Customer Three', '1992-12-20', '0912345678', null, 'customer'),
        (5, 'customer4@example.com', '34cc93ece0ba9e3f6f235d4af979b16c', 'Customer Four', '1985-07-25', '0909876543', null, 'customer');


insert into fake_hotell.bookingver3 (BookingId, CustomerName, RoomId, UserId, RoomLocation, RoomDescription, RoomImgLink, RoomPrice, RoomStatus, BookingStartDate, BookingEndDate, BookingTotalPrice)
values  (16, 'Nguyễn Trung Kiên', 1, 2, '123 Main Street', 'Phòng đẹp, thoáng mát, gần trung tâm', 'https://ebm.com.vn/wp-content/uploads/2021/04/e1102df59b990de65bc20bd381f0e6e5.jpg', 3000000, 'rented', '2024-12-11 08:08:00', '2024-12-21 08:08:00', 15000000),
        (17, 'DDxvxv', 2, 3, '456 Second Street', 'Phòng rộng rãi, đầy đủ tiện nghi', 'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2024/07/hinh-anh-ngoi-nha-2.jpg', 5000000, 'rented', '2024-11-28 19:35:00', '2025-01-03 19:35:00', 25000000),
        (18, 'Hiện tại không có ai thuê', 3, 2, '789 Third Street', 'Phòng giá rẻ, phù hợp sinh viên', 'https://smarthome.worldtech.vn/wp-content/uploads/2017/10/cac-mau-nha-vuon-dep-1024x716.jpg', 2000000, 'available', '2000-01-01 00:00:00', '2000-01-01 00:00:00', 10000000),
        (19, 'Phí Hữu Lộc', 4, 3, '321 Fourth Street', 'Phòng đầy đủ nội thất, gần công viên', 'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEg4Dyok79pBarE43F6FPiYaa8EG-JYOZOx9U27ut1wQMCiw3kTjcvOmKtN6VLCWoXY3g8_ITUJQLS8d5mTpyKr-RpFY1WCBj9yS-WqncFvVLEFdFA6TSxIuHqUL5HAqnooCkC98De0WGUUJ/s1600/can-ho-phuc-yen-2_tien-do1.jpg', 4500000, 'rented', '2024-12-11 18:50:00', '2024-12-19 18:50:00', 9000000),
        (20, 'Nguyễn Trung Kiên', 5, 2, '654 Fifth Street', 'Phòng giá rẻ, tiện ích cơ bản', 'https://xaydungnhauytin.com/uploads/mau-nha-dep/06-2023/mau-thiet-ke-nha-cap-4-mai-thai-dep-1.jpg', 2500000, 'rented', '2024-11-27 23:35:00', '2025-01-02 23:35:00', 5000000),
        (21, 'Hiện tại không có ai thuê', 6, 3, '987 Sixth Street', 'Phòng sang trọng, gần trung tâm thương mại', 'https://www.kientrucapollo.vn/kientrucapollo/huyen2019/BV19012/Mau-nha-vuon-mai-thai-dep-1-tang-2.jpg', 8000000, 'rented', '2000-01-01 00:00:00', '2000-01-01 00:00:00', 16000000),
        (22, 'Hiện tại không có ai thuê', 7, 2, '789 Seventh Street', 'Phòng nhỏ gọn, giá hợp lý', 'https://thietkenhadepmoi.com/wp-content/uploads/2021/04/mau-nha-dep-mai-thai-2021.jpg', 1800000, 'rented', '2000-01-01 00:00:00', '2000-01-01 00:00:00', 3600000),
        (23, 'Hiện tại không có ai thuê', 8, 3, '123 Eighth Street', 'Phòng cao cấp, có hồ bơi riêng', 'https://khonhamaudep.com/wp-content/uploads/2024/10/mau-nha-cap-4-1.jpg', 12000000, 'available', '2000-01-01 00:00:00', '2000-01-01 00:00:00', 24000000),
        (24, 'Customer One', 9, 2, '456 Ninth Street', 'Phòng trung bình, phù hợp hộ gia đình', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQN3r6DCqAWNfaAsqZqF4QvwPCrQA5xrDHfAg&s', 4000000, 'available', '2024-12-20 16:00:00', '2024-12-25 12:00:00', 8000000),
        (25, 'Hiện tại BookingIdCustomerNameRoomTypeIdUserIdRoomLocationRoomDescriptionRoomImgLinkBookingStartDateBookingEndDateBookingEndDateBookingTotalPricekhông có ai thuê', 10, 3, '789 Tenth Street', 'Phòng rộng rãi, gần trường học', 'https://example.com/image10.jpg', 6000000, 'available', '2000-01-01 00:00:00', '2000-01-01 00:00:00', 12000000);
        
SELECT RoomStatus, COUNT(RoomId) AS RoomCount
FROM fake_hotell.bookingver3
WHERE LOWER(RoomStatus) = 'rented'
GROUP BY RoomStatus;
        
SELECT 
    RoomStatus, 
    COUNT(RoomId) AS RoomCount
FROM 
    fake_hotell.bookingver3
GROUP BY 
    RoomStatus;

        