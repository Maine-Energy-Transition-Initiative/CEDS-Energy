# Attach packages ==============================================================

library(readr)
library(here)
library(dplyr)
library(purrr)
library(quarto)
library(fs)
library(readxl)
library(tinytex)

# Load data ====================================================================

Energy_Audits_render <- read_sheet("https://docs.google.com/spreadsheets/d/1L38lSRkBoKfQBvQ4I7ItyoWNYLbWi3Lg4Jh2KKlzdOg/edit?usp=sharing")

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

Audit_reports_pdf <- Audit_reports_html |>
  mutate(
   output_file = gsub("html", "pdf", output_file),
    output_format = gsub("html", "pdf", output_format)
  )

#Docx reports

Audit_reports_docx <- Audit_reports_html |>
  mutate(
    output_file = gsub("html", "docx", output_file),
    output_format = gsub("html", "docx", output_format)
  )
# Bind HTML and PDF report dataframes together

Audit_reports <- rbind(Audit_reports_html, Audit_reports_pdf, Audit_reports_docx)

# Select to render =============================================


Audit_reports_sub <- Audit_reports|>
  select(output_file, output_format, execute_params)

# Map over each row ============================================================

pwalk(
  Audit_reports_sub,
  quarto::quarto_render,
  input = here("Quarto_report/Energy_Report_Summer.qmd"),
  .progress = TRUE
)

# Move reports to separate folder ==============================================

output_dir <- "reports_summer"

# List files that contain ".html" or ".pdf".
files <- dir_ls(here(), regexp = ".html$|.pdf$|.docx")

# Create directory if needed
dir_create(output_dir)

# Move the files
file_move(files, output_dir)
