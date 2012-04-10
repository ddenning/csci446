authorization do
	role :guest do
		has_permission_on :users, :to => [:new, :create]
		has_permission_on :games, :to => [:index, :show]
	end

	role :member do
		has_permission_on :member_member, :to => :index
		has_permission_on :member_users, :to => [:show, :edit, :update]
		has_permission_on :member_games, :to => [:index, :show, :new, :create]
		has_permission_on :member_games, :to => [:edit, :update] do
			if_attribute :user => is { current_user }
		end
	end
	
	role :admin do
		has_permission_on :admin_users, :to => :manage
		has_permission_on :admin_roles, :to => :manage
		has_permission_on :admin_games, :to => :manage
	end
end

privileges do
	privilege :manage, :includes => [:index, :show, :new, :create, :edit, :update, :destroy]
end