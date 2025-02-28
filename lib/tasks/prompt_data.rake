desc "Delete everything in database"
task :delete_all_prompt_data => [ :environment ] do
  puts "Deleting all prompt data and associated models"
  CodeSubmission.delete_all
  Prompt.delete_all
  TestSuite.delete_all
  TestCase.delete_all
  puts "Data deletion complete!"
end
