
    var geocoder;
var map;
function initialize() {
        
    geocoder = new google.maps.Geocoder();
    var latlng = new google.maps.LatLng(41.8500300, -87.6500500);
    var mapOptions = {
        zoom: 10,
        center: latlng
    }
    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
     
}

function codeAddress(jsonResult) {
    for (var i = 0; i < jsonResult.length; i++) {
        if (jsonResult[i].Address == undefined || jsonResult[i].Address == "") continue;
        var content = "<div class=\"project_content\"><h2><a href=\"" + jsonResult[i].Link + "\" target=\"_blank\">" + jsonResult[i].Name + "</a></h2><hr/><p>" + $(jsonResult[i].Thumbnail).html() + jsonResult[i].Description + "</p>"
            + "<p><a href=\"" + jsonResult[i].Link + "\" target=\"_blank\">More Info...</a><em><a target=\"_blank\" href=\"https://maps.google.com?q=" + encodeURIComponent(jsonResult[i].Address) + "\">Get Directions On Google</a></em></p>" +
            "</div>";

        setMarker(jsonResult[i].Address, content);
    }
        
}
function setMarker(address,content)
{
    geocoder.geocode({ 'address': address }, function (results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            map.setCenter(results[0].geometry.location);
            var infowindow = new google.maps.InfoWindow({
                content: content
            });
            var marker = new google.maps.Marker({
                map: map,
                position: results[0].geometry.location
            });
            google.maps.event.addListener(marker, 'click', function () {
                infowindow.open(map, marker);
            });
        } else {
            alert('Geocode was not successful for the following reason: ' + status);
        }
    });
}
google.maps.event.addDomListener(window, 'load', initialize);
$(document).ready(function() {
    $("#btnSearch").click(function (e) {
        
        $.getJSON(mapResultUrl, "addressKeywords=" + $("#address").val(), function (data) {

            if (data == "") {
                alert("No Result!");
                return false;
            }
            codeAddress(data);
        }).fail(function() {
            if (confirm("You need to refresh the page to proceed, refresh?")) {
                location.reload();
            }
        });
    });
});

