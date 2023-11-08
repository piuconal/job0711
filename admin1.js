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
          row.insertCell(0).textContent = gv.Ma_giao_vien;
          row.insertCell(1).textContent = gv.Ten_giao_vien;
          row.insertCell(2).textContent = gv.Dia_chi;
          row.insertCell(3).textContent = gv.So_dien_thoai;
          row.insertCell(4).textContent = gv.CCCD;
          row.insertCell(5).textContent = gv.Gioi_tinh;
          row.insertCell(6).textContent = gv.Ngay_sinh;
          row.insertCell(7).textContent = gv.Email;
        });
      } else {
        console.error("Lỗi khi tải dữ liệu từ server.");
      }
    }
  };
  xhttp.open("GET", "get_giangvien.php", true);
  xhttp.send();
});
