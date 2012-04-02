authorization do
	role :admin do
		has_permission_on :admin_admin, :to => :index
		has_permission_on :admin_users, :to => :manage
		has_permission_on :admin_roles, :to => :manage
	end

	role :member do
		has_permission_on :member_controller, :to => :index
		has_permission_on :member_users, :to => [:show, :edit, :update]
	end

	role :guest do
		has_permission_on :users, :to => [:new, :create]
	end
end

privileges do
	privilege :manage, :includes => [:index, :show, :new, :create, :edit, :update, :destroy]
end