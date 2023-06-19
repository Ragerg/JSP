<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8" />
  <title>Kakao map</title>
</head>

<body>


  <div id="map" style="width:500px;height:400px;"></div>
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3be059b28175bae0d5c7b1b5d47bd7a8"></script>
  <script>
    var container = document.getElementById('map');
    var options = {
      center: new kakao.maps.LatLng(37.4590828, 127.1537789),
      level: 3
    };

    var map = new kakao.maps.Map(container, options);
  </script>


</body>

</html>