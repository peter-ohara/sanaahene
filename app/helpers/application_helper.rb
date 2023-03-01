# frozen_string_literal: true

module ApplicationHelper
  def tailwind_classes_for(flash_type)
    {
      notice: 'bg-green-400 border-l-4 border-green-700 text-white',
      alert: 'bg-red-400 border-l-4 border-red-700 text-black'
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def toolbar(navigation_icon:, title: nil, menu_items: [])
    render('shared/toolbar', navigation_icon:, title:, menu_items:)
  end

  def tw_text_field(form, field_name)
    content_tag(:div, class: 'mb-3') do
      safe_concat(form.label(field_name, class: 'block text-sm font-medium text-gray-700'))
      safe_concat(form.text_field(field_name,
                                  class: 'mt-1 block h-[45px] p-3 w-full rounded border border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 text-bold'))
    end
  end

  def navigation_bar(&block)
    content_tag(:nav,
                class: 'fixed bottom-0 inset-x-0 bg-white h-16 flex justify-around items-center text-gray-500 z-20 font-mono shadow-t', &block)
  end

  def detail_view(item, fields)
    render 'shared/detail_view', item:, fields:
  end

  def panel(&block)
    render 'shared/panel', &block
  end

  def format_meter(meter)
    return unless meter.amount_balance < meter.reorder_point

    'text-red-500'
  end

  def bank_color(bank)
    colors = {
      'Momo' => 'bg-yellow-200',
      'Binance' => 'bg-slate-300',
      'Ecobank' => 'bg-blue-200'
    }

    colors[bank]
  end

  def pnl_color(pnl_type)
    colors = {
      'uncategorized' => 'bg-gray-200',
      'expense' => 'bg-red-300',
      'income' => 'bg-green-200',
      'transfer' => 'bg-gray-200'
    }

    colors[pnl_type]
  end

  def fab(icon, url, id = '', classes = '')
    render 'shared/fab', icon_name: icon, url:, id:, classes:
  end

  def delete_button(resource)
    button_to(icon(:delete), resource, method: :delete, form: { data: { turbo_confirm: 'Are you sure?' } },
                                       class: 'flex items-center')
  end

  def import_button(url)
    render('shared/import_button', url:)
  end

  def icon(name, classes: nil, color: 'text-gray-500')
    content_tag(:span, name, class: "material-icons #{classes} #{color}")
  end

  def no_content_for(symbol)
    content_for(symbol, flush: true)
  end

  def sidenav_icon
    render 'shared/sidenav_icon'
  end

  def deck(items, title: nil, headline_text: nil, supporting_text: nil, leading_content: nil, trailing_content: nil)
    render('shared/deck',
           items:, title:, headline_text:, supporting_text:, leading_content:, trailing_content:)
  end

  def grouped_deck(groups, title: nil, headline_text: nil, supporting_text: nil, leading_content: nil,
                   trailing_content: nil)
    render('shared/grouped_deck', groups:, title:, headline_text:,
                                  supporting_text:, leading_content:, trailing_content:)
  end

  def resolve_leading_content(item, leading_content)
    return nil if leading_content.blank?

    icon_name = item.send(leading_content) if item.respond_to?(leading_content)
    icon(icon_name)
  end
end
