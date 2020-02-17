require 'rails_helper'

describe DeclarationsController do
  describe 'GET #index' do
    it "indexのビューが表示されるか" do
      get :index
      expect(response).to be_success
    end

    it 'リクエストが成功すること' do
      get :index
      expect(response.status).to eq 200
    end
  end

  describe 'GET #new' do
    context 'ログイン状態' do
      before do
        @user = create(:user)
        login @user
      end

      it "newのビューが表示されるか" do
        get :new
        expect(response).to be_success
      end

      it 'リクエストが成功すること' do
        get :new, params: { id: @user }
        expect(response.status).to eq 200
      end
    end

    context 'ログアウト状態' do
      it "newのビューが開かれずに、indexのビューが表示されるか" do
        get :new
        expect(response).to redirect_to action: :index
      end

      it 'リクエストが成功すること' do
        get :new
        expect(response.status).to eq 302
      end
    end
  end

  describe 'GET #score' do
    context 'ログイン状態' do
      before do
        @user = create(:user)
        login @user
      end

      it "scoreのビューが開かれるか" do
        get :score
        expect(response).to be_success
      end

      it 'リクエストが成功すること' do
        get :score, params: { id: @user }
        expect(response.status).to eq 200
      end
    end

    context 'ログアウト状態' do
      it "scoreのビューが開かれずに、indexのビューが表示されるか" do
        get :score
        expect(response).to redirect_to action: :index
      end

      it 'リクエストが成功すること' do
        get :score
        expect(response.status).to eq 302
      end
    end
  end

  describe 'POST #create' do
    
    context 'ログイン状態' do
      before do
        user = create(:user)
        login user
      end

      context '保存ができる場合' do
        subject {post :create, params: {declaration: {what: "勉強", why: "エンジニアになるため", time: "３時間", score: "01:00:00", start: "15:00", end: "17:00"}}}
        it '保存できているか' do
          expect {subject}.to change(Declaration, :count).by(1)
        end

        it 'リダイレクト先が表示されるか' do
          subject
          expect(response).to redirect_to new_declaration_path
        end

        it 'リクエストが成功すること' do
          subject
          expect(response.status).to eq 302
        end
      end

      context '保存ができない場合' do
        subject {post :create, params: {declaration: {what: nil, why: "エンジニアになるため", time: "３時間", score: "01:00:00", start: "15:00", end: "17:00"}}}
        it '保存がされていないか' do
          expect {subject}.not_to change(Declaration, :count)
        end

        it 'リダイレクト先が表示されるか' do
          subject
          expect(response).to render_template(:new)
        end

        it 'リクエストが成功すること' do
          subject
          expect(response.status).to eq 200
        end
      end
    end

    context 'ログインアウト状態' do
      it "createされずに、indexのビューが表示されるか" do
        post :create
        expect(response).to redirect_to action: :index
      end

      it 'リクエストが成功すること' do
        post :create
        expect(response.status).to eq 302
      end
    end
  end

  describe 'DELETE #destroy' do
    before do
      user = create(:user)
      login user
      @declaration = user.declarations.create(what: "勉強", why: "エンジニアになるため", time: "３時間", score: "03:00:00", user_id: 1, start: "15:00", end: "17:00")
    end
    context 'ログイン状態' do
      it '削除されるか' do
        expect{
          delete :destroy, params: { id: @declaration }
        }.to change(Declaration, :count).by(-1)
      end

      it 'リダイレクト先が表示されるか' do
        delete :destroy, params: { id: @declaration }
        expect(response).to redirect_to declarations_path
      end

      it 'リクエストが成功すること' do
        delete :destroy, params: { id: @declaration }
        expect(response.status).to eq 302
      end
    end

    context 'ログアウト状態' do
      it "deleteされずに、indexのビューが表示されるか" do
        delete :destroy, params: { id: @declaration, user_id: nil }
        expect(response).to redirect_to declarations_path
      end

      it 'リクエストが成功すること' do
        delete :destroy, params: { id: @declaration, user_id: nil }
        expect(response.status).to eq 302
      end
    end
  end
end