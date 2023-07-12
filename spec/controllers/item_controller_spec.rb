require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  render_views

  let!(:seller1){create :seller}
  let!(:items){create_list :item, 5}
  let!(:items_params) do
    {
      item:{
        name: "car",
        price: 4343.34,
        description: "black",
        seller_id: seller1.id
      }
    }
  end
  context "GET #index" do
    before {get :index}

    it "returns items" do
      is_expected.to render_template :index
      expect(assigns(:items)).to match_array(items)
    end
  end

  context "delete , update , create, upvote, "  do
    let!(:item1){create :item}
    let!(:params) {
      {
        id: item1.id
      }
    }
   
    context "DELETE #destroy" do

      subject{post :destroy, params: params}

      it "item deleted" do
        item1.reload
        expect{subject}.to change(Item, :count).by(-1)
      end

      it "redirected to index" do
        expect(subject).to redirect_to action: :index
      end
    end
    context "POST #create" do
      subject {post :create, params: items_params}

      it "item saved" do
        expect{subject}.to change(Item, :count).by 1
      end

      it "redirected to index" do
        expect(subject).to redirect_to action: :index
      end

      context "with invalid params" do
        let!(:items_params) {{
          item:{ price: -323}
        }}

        it "item wasn't save" do
          expect{subject}.to_not change(Item, :count)
        end

        it "redirected to new" do
          expect(subject).to redirect_to action: :new
        end
      end
    end
  end



end

