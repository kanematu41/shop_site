class Admin::OrderDetailsController < ApplicationController
	before_action :authenticate_admin_admin!
	def update
		order_detail = OrderDetail.find(params[:id])
		order_detail.update(order_detail_params)
		if order_detail.item_status == "製作中"
			order_detail.order.order_status = "製作中"
			order_detail.order.save
		end
		all_item_status = 0
		order_detail.order.order_details.each do |order_detail|
			# 製作完了が一つでもしていなければ +1
			if order_detail.item_status != "製作完了"
				all_item_status += 1
			end
		end
		if all_item_status == 0
			order_detail.order.order_status = "発送準備中"
			order_detail.order.save
		end
		redirect_back(fallback_location: root_path)
	end

	private

	def order_detail_params
		params.require(:order_detail).permit(:item_status)
	end
end
