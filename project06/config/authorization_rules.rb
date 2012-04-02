authorization do
	role :admin do
		has_permission_on :admin_controller, :to => :all
	end

	role :member do
		has_permission_on :member_controller, :to => :all
	end

	role :guest do
		has_permission_on :users_controller, :to => :all
	end
end