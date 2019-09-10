# First update of IMCR software category keywords since the IMCR Controlled
# Vocabulary refactor (August 2019) and first time using the API to perform 
# this maintenance. All metadata was backed up yesterday.

# Initialize workspace for this script
rm(list = ls())
library(toolkit)

# Create log file of keyword syncrhonization and reload all JSON (because
# sync_software_category() modifies the imcr_json object).
get_imcr_json()
sync_software_category("all_imcr_software")
rm(list = ls())
get_imcr_json()

# Use log file to modify keywords of all IMCR software metadata
# Replace "import" with "loading"
modify_software_category(
  action = "replace",
  name = "all_imcr_software",
  old.term = "import",
  new.term = "loading"
)
# Replace "storage" with "preservation"
modify_software_category(
  action = "replace",
  name = "all_imcr_software",
  old.term = "storage",
  new.term = "preservation"
)
# Replace "workflow management" with "workflow planning"
modify_software_category(
  action = "replace",
  name = "all_imcr_software",
  old.term = "workflow management",
  new.term = "workflow planning"
)

# Syncrhonize software category keywords
sync_software_category("all_imcr_software")

# Update all modified IMCR software metadata
put_software()
