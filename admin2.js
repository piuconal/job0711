document.addEventListener("DOMContentLoaded", function () {
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
      if (this.readyState === 4) {
        if (this.status === 200) {
          var data = JSON.parse(this.responseText);
          var tableBody = document.querySelector("#giangvien-table tbody");
          while (tableBody.firstChild) {
            tableBody.removeChild(tableBody.firstChild);
          }
          data.forEach(function (gv) {
            var row = tableBody.insertRow(-1);
            row.insertCell(0).textContent = gv.Ma_sinh_vien;
            row.insertCell(1).textContent = gv.Ten_sinh_vien;
            row.insertCell(2).textContent = gv.So_dien_thoai;
            row.insertCell(3).textContent = gv.Ngay_sinh;
            row.insertCell(4).textContent = gv.Email;
            var xemChiTietButton = document.createElement("button");
            xemChiTietButton.textContent = "Xem hồ sơ";
            row.insertCell(5).appendChild(xemChiTietButton);

            function xemChiTiet(button) {
                // Lấy dữ liệu của bản ghi hồ sơ tương ứng với button
                var row = button.parentElement.parentElement;
                var idHoso = row.cells[0].textContent;
              
                // Hiển thị dữ liệu trong một cửa sổ
                var window = window.open("xem-chi-tiet.html?idHoso=" + idHoso, "Xem chi tiết");
              }
          });
        } else {
          console.error("Lỗi khi tải dữ liệu từ server.");
        }
      }
    };
    xhttp.open("GET", "get_sinhvien.php", true);
    xhttp.send();
  });
  
  document.getElementById("add").addEventListener("click", function(){
    document.getElementById("box").style.display = "block";
    document.getElementById("add_gv").style.display = "flex";
  });
  
  document.getElementById("cancel").addEventListener("click", function(){
    document.getElementById("box").style.display = "none";
    document.getElementById("add_gv").style.display = "none";
  });
  
  setTimeout(function() {
    document.getElementById("error").style.display = "none";
  }, 2000);
  