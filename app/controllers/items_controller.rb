class ItemsController < ApplicationController
	before_action	:set_item, only: [:show]

	def index
		@categories = Category.all
		@items = (Item.not_retired_too + Item.not_retired)
	end

	def show
	end

	private
		def set_item
			@item = Item.find(params[:id])
		end

end
