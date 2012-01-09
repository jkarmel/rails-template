class Views::Home::Index < Erector::Widgets::Page
  def doctype
    '<!DOCTYPE html>'
  end

  def head_content
    title 'Help Yourself'
    stylesheet_link_tag "application"
    javascript_include_tag "application"
    csrf_meta_tags
    # TODO: Replace 'UA...' with the account number from Google Analytics
    javascript <<-JAVASCRIPT
       var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-27972192-1']);
        _gaq.push(['_trackPageview']);

        (function() {
          var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
          ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
          var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
        })();
    JAVASCRIPT
  end

  def body_content
    div :class => 'topbar' do
      div :class => 'fill' do
        div :class => 'container' do
          a :class => 'brand', :href => '#' do
            text "You're all setup!"
          end
        end
      end
    end
  end
end
