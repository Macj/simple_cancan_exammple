# frozen_string_literal: true

require 'rails_helper'

describe 'cards/index', type: :feature, js: true do
  context 'Card behaviour for different roles' do
    let!(:card) { FactoryGirl.create(:card) }

    before do
      sign_in user
      visit cards_path
    end

    shared_context 'card controllers' do
      it 'edit card' do
        expect(page).to have_content('Edit')
      end

      it 'delete card' do
        expect(page).to have_content('Delete')
      end
    end

    context 'admin can' do
      let(:user) { FactoryGirl.create(:user, :admin) }

      include_context 'card controllers'
    end

    context 'staff cannot' do
      let(:user) { FactoryGirl.create(:user, :staff) }

      it 'edit card' do expect(page).not_to have_content('Edit') end
      it 'delete card' do expect(page).not_to have_content('Delete') end
    end

    context 'writer can' do
      let(:user) { FactoryGirl.create(:user, :writer) }

      include_context 'card controllers'
    end
  end
end
