require "application_system_test_case"

class SedesTest < ApplicationSystemTestCase
  setup do
    @sede = sedes(:one)
  end

  test "visiting the index" do
    visit sedes_url
    assert_selector "h1", text: "Sedes"
  end

  test "creating a Sede" do
    visit sedes_url
    click_on "New Sede"

    fill_in "Nombre", with: @sede.nombre
    click_on "Create Sede"

    assert_text "Sede was successfully created"
    click_on "Back"
  end

  test "updating a Sede" do
    visit sedes_url
    click_on "Edit", match: :first

    fill_in "Nombre", with: @sede.nombre
    click_on "Update Sede"

    assert_text "Sede was successfully updated"
    click_on "Back"
  end

  test "destroying a Sede" do
    visit sedes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sede was successfully destroyed"
  end
end
