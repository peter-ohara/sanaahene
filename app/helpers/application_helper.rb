module ApplicationHelper
	def tailwind_classes_for(flash_type)
    {
      notice: "bg-green-400 border-l-4 border-green-700 text-white",
      error:   "bg-red-400 border-l-4 border-red-700 text-black",
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end


	def toolbar(navication_icon, menu_items=[], title="")
		render('shared/toolbar', navication_icon: navication_icon, title: title, menu_items: menu_items)
	end

	def tw_text_field(form, field_name)
		content_tag(:div, class: "mb-3") do
			safe_concat(form.label(field_name, class: "block text-sm font-medium text-gray-700"))
			safe_concat(form.text_field(field_name, class: "mt-1 block h-[45px] p-3 w-full rounded border border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 text-bold"))
		end
	end

	def navtabs(links)
		render 'shared/navtabs', links: links
	end

	def panel()
		render 'shared/panel' do
			 yield
		end
	end

	def fab(icon, url)
		render 'shared/fab', icon: icon, url: url
	end

	def icon(name, class_names="text-gray-500")
			content_tag(:span, name, class: "material-icons #{class_names}")
	end

	def no_content_for(symbol)
		  content_for(symbol, flush: true)
	end

	def sidenav_icon
		render 'shared/sidenav_icon'
	end

	def sidenav
		render 'shared/sidenav'
	end

	def cancel_form_path(resource)
		return resource_path(resource) if resource.persisted?

		return users_path
	end

	def alert(message)
		render 'shared/alert', message: message
	end
end
