module ApplicationHelper
  class BootstrapLinkRenderer < ::WillPaginate::ActionView::LinkRenderer
    protected

    def html_container(html)
      tag :div, tag(:ul, html), container_attributes
    end

    def page_number(page)
      tag :li, link(page, page, :rel => rel_value(page)), :class => ('active' if page == current_page)
    end

    def gap
      tag :li, link(super, '#'), :class => 'disabled'
    end

    def previous_or_next_page(page, text, classname)
      tag :li, link(text, page || '#'), :class => [classname[0..3], classname, ('disabled' unless page)].join(' ')
    end
  end

  def page_navigation_links(pages)
    will_paginate(pages, :class => 'pagination', :inner_window => 2, :outer_window => 0, :renderer => BootstrapLinkRenderer, :previous_label => '&larr;'.html_safe, :next_label => '&rarr;'.html_safe)
  end
  
  def ihelper(in_value, long = false)
    if in_value.nil?
      "None"
    elsif in_value.acts_like?(:time)
      if long
        l(in_value, :format => :long)
      else
        l(in_value)
      end
    elsif in_value.instance_of? Array 
      in_value.map{ |x| ihelper(x)}.join("/")
    else
      if long == :decimal
        in_value.round(2)
      elsif long == :hours
        "#{in_value.floor}:#{((in_value-in_value.floor)*60.0).round(0)}"
      else
        number_to_currency(in_value, :locale => 'en')
      end
    end
  end
  
  def present(object, klass = nil)
    klass ||= "{object.class}Presenter".constantize
    presenter = klass.new(object, self)
    yield presenter if block_given?
    presenter
  end
end
