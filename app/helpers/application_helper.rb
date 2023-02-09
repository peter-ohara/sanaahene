module ApplicationHelper
	def tailwind_classes_for(flash_type)
    {
      notice: "bg-green-400 border-l-4 border-green-700 text-white",
			alert:   "bg-red-400 border-l-4 border-red-700 text-black",
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end


	def toolbar(navigation_icon:, title: nil, menu_items: [])
		render('shared/toolbar', navigation_icon: navigation_icon, title: title, menu_items: menu_items)
	end

	def tw_text_field(form, field_name)
		content_tag(:div, class: "mb-3") do
			safe_concat(form.label(field_name, class: "block text-sm font-medium text-gray-700"))
			safe_concat(form.text_field(field_name, class: "mt-1 block h-[45px] p-3 w-full rounded border border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 text-bold"))
		end
	end

	def navigation_bar
		content_tag(:nav, class: "fixed bottom-0 inset-x-0 bg-white h-16 flex justify-around items-center text-gray-500 z-20 font-mono shadow-t") do
			yield
		end
	end

	def detail_view(item, fields)
		render 'shared/detail_view', item: item, fields: fields
	end

	def panel
		render 'shared/panel' do
			 yield
		end
	end

	def format_meter(meter)
		if meter.balance < meter.reorder_point
			"text-red-500"
		end
	end

	def fab(icon_name, url)
		render 'shared/fab', icon_name: icon_name, url: url
	end

	def delete_button(resource)
		button_to(icon(:delete), resource, method: :delete, form: { data: { turbo_confirm: 'Are you sure?' } }, class: "flex items-center")
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

	def deck(items, headline_text: nil, supporting_text: nil, leading_content: nil, trailing_content: nil)
		render('shared/deck',
				items: items, headline_text: headline_text, supporting_text: supporting_text, leading_content: leading_content, trailing_content: trailing_content
		)
	end

	def grouped_deck(groups, headline_text: nil, supporting_text: nil, leading_content: nil, trailing_content: nil)
		render('shared/grouped_deck', groups: groups, headline_text: headline_text, supporting_text: supporting_text, leading_content: leading_content, trailing_content: trailing_content)
	end

	def resolve_leading_content(item, leading_content)
		return nil if leading_content.blank?

		# return image_tag(item.send(leading_content), class: "flex-none w-6 h-full") if item.respond_to?(leading_content)

		content_tag(:div, icon(leading_content), class: "flex-none w-6 h-full")
	end
end
