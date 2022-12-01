require 'rails_helper'

RSpec.feature "Projects", type: :feature do
  context "Create new project" do
    before(:each) do
      testUser = FactoryBot.create(:user)
      login_as(testUser)
      visit new_project_path
      within("div", id:"title") do
        fill_in "Title", with: "Test title"
      end
    end

    scenario "should be successful" do
      fill_in "Description", with: "Test description"
      click_button "Submit"
      expect(page).to have_content("Project was successfully created")
    end

    scenario "should fail" do
      click_button "Submit"
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Update project" do
    let(:project) { Project.create(title: "Test title", description: "Test content") }
    before(:each) do
      testUser = FactoryBot.create(:user)
      login_as(testUser)
      visit edit_project_path(project)
    end

    scenario "should be successful" do
      within("div", id: "description") do
        fill_in "Description", with: "New description content"
      end
      click_button "Submit"
      expect(page).to have_content("Project was successfully updated")
    end

    scenario "should fail" do
      within("div", id: "description") do
        fill_in "Description", with: ""
      end
      click_button "Submit"
      expect(page).to have_content("Description can't be blank")
    end
  end

  context "Remove existing project" do
    let!(:project) { Project.create(title: "Test title", description: "Test content") }
    scenario "remove project" do
      visit projects_path
      click_link "Show this project"
      testUser = FactoryBot.create(:user)
      login_as(testUser)
      click_button "Destroy this project"
      expect(page).to have_content("Project was successfully destroyed")
      expect(Project.count).to eq(0)
    end
  end
end