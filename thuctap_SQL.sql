create table Khoa (
  makhoa char(10) primary key,
  tenkhoa char(30),
  dienthoai char(10)
);

create table GiangVien (
  magv int  primary key,
  hotengv char(30),
  luong decimal(5, 2),
  makhoa char(10),
  foreign key(makhoa) references Khoa(makhoa)
);

create table SinhVien (
  masv int  primary key,
  hotensv char(30),
  makhoa char(10),
  namsinh int,
  quequan char(30),
 foreign key (makhoa) references Khoa(makhoa)
);


create table DeTai (
  madt char(10)  primary key,
  tendt char(30),
  kinhphi int,
  NoiThucTap char(30)
);

create table HuongDan (
  masv int,
  madt char(10),
  magv int,
  ketqua decimal(5, 2),
  foreign key (masv) references SinhVien(masv),
  foreign key (madt) references DeTai(madt),
  foreign key (magv) references GiangVien(magv)
);


-- Câu 1: Sử dụng lệnh truy vấn SQL lấy ra mã số và tên các đề tài có nhiều hơn 2 sinh viên tham gia thực tập.

select detai.madt, detai.tendt 
from detai
join huongdan on detai.madt = huongdan.madt
having count(huongdan.madt)>2;

 -- Câu 2: Sử dụng câu lệnh truy vấn SQL lấy ra mã số, tên đề tài của đề tài có kinh phí cao nhất .
 
 select madt, tendt 
 from detai 
 where kinhphi = ( 
	select max(kinhphi) 
    from detai
    );
 
 -- Câu 3: Sử dụng câu lệnh SQL xuất ra Tên khoa, Số lượng sinh viên của mỗi khoa .
 
 select count(sinhvien.makhoa) as soluong, khoa.tenkhoa 
 from khoa
 join sinhvien 
 on sinhvien.makhoa = khoa.makhoa
 group by sinhvien.makhoa;


