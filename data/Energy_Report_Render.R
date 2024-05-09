# Attach packages ==============================================================

library(readr)
library(here)
library(dplyr)
library(purrr)
library(quarto)
library(fs)
library(readxl)

# Load data ====================================================================

Energy_Audits_render <- read_excel("/data/data/Energy_Audit_template.xlsx")


# Create dataframe to iterate over =============================================

# HTML reports

Energy_Audits_html <- pets |>
  distinct(Adress_Name) |>
  mutate(
    output_format = "html",
    output_file = paste(
      tolower(adress),
      tolower(gsub(" ", "-", breed)),
      "report.html",
      sep = "-"
    ),
    execute_params = map2(
      pet_type,
      breed,
      \(pet_type, breed) list(pet_type = pet_type, fave_breed = breed)
    )
  )

# PDF reports

pet_reports_pdf <- pet_reports_html |>
  mutate(
    output_file = gsub("html", "pdf", output_file),
    output_format = gsub("html", "pdf", output_format)
  )

# Bind HTML and PDF report dataframes together

pet_reports <- rbind(pet_reports_html, pet_reports_pdf)

# Subset to first 2 cat/dog breeds =============================================

pet_reports_subset <- pet_reports |>
  slice_head(n = 2, by = c(pet_type, output_format)) |>
  select(output_file, output_format, execute_params)

# Map over each row ============================================================

pwalk(
  pet_reports_subset,
  quarto_render,
  input = here("4-demo-quarto-render-purrr.qmd"),
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

