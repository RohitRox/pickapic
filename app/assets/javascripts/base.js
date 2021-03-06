$(document).ready(
  function(){
    $('#new_project_form').hide();
    $('a[href$="#"]').attr("href","javascript:void(0)");
    $('#new_project_click').click(function(){
      $('#new_project_form').slideToggle();
    });

    $('#project_table').dataTable({ "aLengthMenu": [[5, 10, 15, -1], [5, 10, 15, "All"]] });

    $('#help').hide();
    $('a[rel*=facebox]').facebox();

    $('#briefing').hide();
    $('#show_brief').click(function(){
      $('#briefing').slideToggle();
    });

    $('#login_ul').hide();
    $('#login_show a').click(
      function(){
        $(this).parent().find('#login_ul').slideToggle();
        $('#login_ul li').not('.active').find('.form_login').hide();

      });

      $('#login_ul li h4').click(function(){

        $(this).parent().parent().find('li').not('.active').find('.form_login').addClass('open').slideToggle();
        $(this).parent().parent().find('li.active .form_login').slideToggle().parent().removeClass('active');
        $(this).parent().parent().find('.open').parent().addClass('active').find('.open').removeClass('open');
      });

      // $('#logo_project_form').hide();
      //       $('#create_logo_project').click(function(){
        //         $('#logo_project_form').slideToggle();
        //       });

        $('#project_more_details').hide();
        $('#trigger_more').click(function(){
          $("#project_more_details").slideToggle();
        });

        $('.project-info').tipTip({defaultPosition:"right"});

        var $container = $('#project_list');
        // initialize isotope
        $container.isotope({
          layoutMode : 'fitRows'
        });

        // filter items when filter link is clicked
        $('#filters a').click(function(){
          var selector = $(this).attr('data-filter');
          $container.isotope({ filter: selector });
          return false;
        });

        $('#filters a').click(function(){
          $(this).parent().parent().find('.active').removeClass('active');
          $(this).addClass('active');
        });
        
        $('.field').each(function(){
          $('label:first',this).addClass('main-label');
        });
       

      });

