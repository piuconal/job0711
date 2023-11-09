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
          xemChiTietButton.addEventListener("click", function () {
            displayProfile(gv);
          });
          row.insertCell(5).appendChild(xemChiTietButton);
        });
      } else {
        console.error("Lỗi khi tải dữ liệu từ server.");
      }
    }
  };
  xhttp.open("GET", "get_sinhvien.php", true);
  xhttp.send();
});
function displayProfile(student) {
  var modal = document.createElement("div");
  modal.className = "modal";
  modal.innerHTML = `
    <div class="modal-content">
      <span class="close-button" onclick="closeProfile()">❌</span>
      <h2>${student.Ten_sinh_vien}</h2>
      <table>
        <tr>
          <td>Mã SV:</td>
          <td>${student.Ma_sinh_vien}</td>
        </tr>
        <tr>
          <td>Ngày sinh:</td>
          <td>${student.Ngay_sinh}</td>
        </tr>
        <tr>
          <td>Giới tính:</td>
          <td>${student.Gioi_tinh}</td>
        </tr>
        <tr>
          <td>Địa chỉ:</td>
          <td>${student.Dia_chi}</td>
        </tr>
        <tr>
          <td>Email:</td>
          <td>${student.Email}</td>
        </tr>
        <tr>
          <td>Số điện thoại:</td>
          <td>${student.So_dien_thoai}</td>
        </tr>
        <tr>
          <td>Số CCCD:</td>
          <td>${student.CCCD}</td>
        </tr>
        <tr>
          <td>Dân tộc:</td>
          <td>${student.Dan_toc}</td>
        </tr>
        <tr>
          <td>Tôn giáo:</td>
          <td>${student.Ton_giao}</td>
        </tr>
        <tr>
          <td>Nơi sinh:</td>
          <td>${student.Noi_sinh}</td>
        </tr>
      </table>
      <p id="sv">Sinh viên tại BeautySchool</p>
    </div>
  `;
  document.body.appendChild(modal);
}

function closeProfile() {
  var modal = document.querySelector(".modal");
  modal.parentNode.removeChild(modal);
}
document.getElementById("add").addEventListener("click", function () {
  document.getElementById("box").style.display = "block";
  document.getElementById("add_gv").style.display = "flex";
});

document.getElementById("cancel").addEventListener("click", function () {
  document.getElementById("box").style.display = "none";
  document.getElementById("add_gv").style.display = "none";
});

setTimeout(function () {
  document.getElementById("error").style.display = "none";
}, 2000);
