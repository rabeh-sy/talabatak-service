require 'rails_helper'

RSpec.describe Admin::RestaurantPolicy, type: :policy do
  subject { Admin::RestaurantPolicy.new(user, restaurant) }

  let(:restaurant) { Restaurant.create({ name: "Test Restaurant" }) }

  context "for a normal user" do
    let(:user) { User.create!(email_address: 'test@example.com', password: 'password') }

    context "who owns the restaurant" do
      let(:restaurant) { Restaurant.create({ name: "Test Restaurant", user_id: user.id }) }

      it { should permit(:show)    }
      it { should_not permit(:create)  }
      it { should_not permit(:new)     }
      it { should permit(:update)  }
      it { should permit(:edit)    }
      it { should_not permit(:destroy) }
    end

    context "who does not own the restaurant" do
      it { should_not permit(:show)    }
      it { should_not permit(:create)  }
      it { should_not permit(:new)     }
      it { should_not permit(:update)  }
      it { should_not permit(:edit)    }
      it { should_not permit(:destroy) }
    end
  end

  context "for a super admin" do
    let(:user) { User.create!(email_address: 'test@example.com', password: 'password', super_admin: true) }

      it { should permit(:show)    }
      it { should permit(:create)  }
      it { should permit(:new)     }
      it { should permit(:update)  }
      it { should permit(:edit)    }
      it { should permit(:destroy) }
  end
end
