// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree.

//= require jquery
//= require best_in_place

//= require best_in_place.jquery-ui

var ready = function() {
  /* Activating Best In Place */
  $(".best_in_place").best_in_place();
  
  $('.best_in_place').bind("ajax:success", function(e, data) {
    var dataJSON = JSON.parse(data);
    var target = $(e.target);
    var prevValue = parseFloat(target.data().bipOriginalContent);
    var nextValue = parseFloat(dataJSON.total)
    target.data('bipOriginalContent', dataJSON.total)
    target.text(dataJSON.total);

    var targetData = target.parent().data();
    
    var sumData = $('.sum-movement').map(function(e, sum) { return [[$(sum), $(sum).data()]] });
    var finded = sumData.filter(function(i, obj) {
      return (JSON.stringify(targetData) === JSON.stringify(obj[1]));
    });

    if (finded.length > 0) {
      var el = finded[0][0];
      var oldValue = parseFloat(el.html());
      var deltaValue = Math.abs(nextValue - prevValue);
      var newSum = oldValue;
      if (nextValue > prevValue) {
        newSum = oldValue + deltaValue;
      } else if (nextValue < prevValue) {
        newSum = oldValue - deltaValue;
      }
      el.text(newSum.toFixed(1));
    }
  });

  $('.newinout').on('click', function (e) {
    var targetData = $(e.target).data();
    var result = prompt('Название', '');

    console.log(
      new Date(targetData.year, targetData.month - 1),
      targetData.movementId,
      targetData.projectId,
      result
    )

    $.ajax({
      method: 'POST',
      url: '/inflows_outflows',
      data: {
        inflows_outflow: {
          movement_id: targetData.movementId,
          project_id: targetData.projectId,
          name: result,
          date_f: new Date(targetData.year, targetData.month - 1, 5),
          total: 0,
        }
      }
    })
  })

  $('.yearmonth').on('click', function (e) {
    var result = confirm('Создать новую запись?');
    if (result) {
      var targetData = $(e.target).data();
      console.log(
        new Date(targetData.year, targetData.month - 1),
        targetData.movementId,
        targetData.projectId,
        targetData.name.toString()
      )
      $.ajax({
        method: 'POST',
        url: '/inflows_outflows',
        data: {
          inflows_outflow: {
            movement_id: targetData.movementId,
            project_id: targetData.projectId,
            name: targetData.name.toString(),
            date_f: new Date(targetData.year, targetData.month - 1, 5),
            total: 0,
          }
        }
      })
    }
  });

  // var sum = $('.sum-movement');
  // var npv = 0;
  // debugger
  // $.each(sum, function(i, sum) {
  //   var tmp = $(this).text();
  //   npv = npv + parseFloat(tmp);
  // });
  // $('.NPV').text(npv);
}

// $(document).ready(ready)
$(document).on('turbolinks:load', ready)
