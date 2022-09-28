require "application_system_test_case"

class JobsTest < ApplicationSystemTestCase
  setup do
    @job = jobs(:one)
  end

  test "visiting the index" do
    visit jobs_url
    assert_selector "h1", text: "Jobs"
  end

  test "should create job" do
    visit jobs_url
    click_on "New job"

    fill_in "Department", with: @job.department
    fill_in "Employee", with: @job.employee
    fill_in "Job", with: @job.job
    fill_in "Status", with: @job.status
    click_on "作成"

    assert_text "Job was successfully created"
    click_on "Back"
  end

  test "should update Job" do
    visit job_url(@job)
    click_on "Edit this job", match: :first

    fill_in "Department", with: @job.department
    fill_in "Employee", with: @job.employee
    fill_in "Job", with: @job.job
    fill_in "Status", with: @job.status
    click_on "Update Job"

    assert_text "Job was successfully updated"
    click_on "Back"
  end

  test "should destroy Job" do
    visit job_url(@job)
    click_on "Destroy this job", match: :first

    assert_text "対象業務は削除しました。"
  end
end
