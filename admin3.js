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
            row.insertCell(0).textContent = gv.Ma_lop;
            row.insertCell(1).textContent = gv.Ten_lop;
          });
        } else {
          console.error("Lỗi khi tải dữ liệu từ server.");
        }
      }
    };
    xhttp.open("GET", "get_lophoc.php", true);
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
  