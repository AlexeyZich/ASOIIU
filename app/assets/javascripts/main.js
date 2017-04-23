$(document).ready(function() {
  // alert('hello');

  $('.project-table .next').on('click', function() {
    var activeItem = $('.project-table .months > .item.active');
    var nextItem = activeItem.next();

    if (!nextItem.hasClass('item')) {      
      nextItem = $('.project-table .months').children().first()
    }

    activeItem.removeClass('active');
    nextItem.addClass('active');
  });

  $('.project-table .prev').on('click', function() {
    var activeItem = $('.project-table .months > .item.active');
    var prevItem = activeItem.prev();

    if (!prevItem.hasClass('item')) {      
      prevItem = $('.project-table .months').children().last()
    }

    activeItem.removeClass('active');
    prevItem.addClass('active');
  });
});
