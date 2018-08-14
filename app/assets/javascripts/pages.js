$(document).ready(function () {
  $('#static-table').DataTable();

    $('#ajax-table').DataTable({
      ajax: {
          url: '/get_dataset',
          dataSrc: 'lines',
      },
      columns: [
          {title: 'Season', data: 'season', class: 'season-column'},
          {title: 'Episode', data: 'episode', class: 'episode-column'},
          {title: 'Character', data: 'character', class: 'character-column'},
          {title: 'Line', data: 'line'}
      ],
      order: [['2', 'desc']]
    });
});
