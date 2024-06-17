# Attach packages ==============================================================

library(readr)
library(here)
library(dplyr)
library(purrr)
library(quarto)
library(fs)
library(readxl)

# Load data ====================================================================

Energy_Audits_render <- read_excel("../CEDS-Energy/data/Energy_Audit_template.xlsx")

# Create data frame to iterate over =============================================

# HTML reports

Audit_reports_html <- Energy_Audits_render |>
  distinct(Adress_Name, Auditor_full_name) |>
  mutate(
    output_format = "html",
    output_file = paste(
      tolower(Adress_Name),
      tolower(gsub(" ", "-", Auditor_full_name)),
      "report.html",
      sep = "-"
    ),
    execute_params = map2(
      Adress_Name,
      Auditor_full_name,
      \(Adress_Name, Auditor_full_name) list(adress = Adress_Name, author = Auditor_full_name)
    )
  )

# PDF reports

#pet_reports_pdf <- pet_reports_html |>
  #mutate(
 #   output_file = gsub("html", "pdf", output_file),
 #   output_format = gsub("html", "pdf", output_format)
 # )

# Bind HTML and PDF report dataframes together

#pet_reports <- rbind(pet_reports_html, pet_reports_pdf)

# Subset to first 2 cat/dog breeds =============================================

#pet_reports_subset <- pet_reports |>
  #slice_head(n = 2, by = c(pet_type, output_format)) |>
  #select(output_file, output_format, execute_params)

# Map over each row ============================================================

Audit_reports_html_sub <- Audit_reports_html[, 3:5]

pwalk(
  Audit_reports_html_sub,
  quarto::quarto_render,
  input = here("Energy_Report.qmd"),
  .progress = TRUE
)

# Move reports to separate folder ==============================================

output_dir <- "reports"

# List files that contain ".html" or ".pdf".
files <- dir_ls(here(), regexp = ".html$|.pdf$")

# Create directory if needed
dir_create(output_dir)

# Move the files
file_move(files, output_dir)