# Source: @vintented via https://github.com/2DegreesInvesting/r2dii.analysis/
#   issues/6#issuecomment-561543097

read_and_sanitize <- function(path, sheet) {
  out <- readxl::read_excel(path, sheet = sheet)
  out$Year <- as.integer(out$Year)
  out
}

path <- here::here("data-raw", "market_portfolio.xlsx")
portfolio <- read_and_sanitize(path, sheet = "Portfolio")
portfolio %>% readr::write_csv("data-raw/portfolio.csv")
# usethis::use_data(portfolio, overwrite = TRUE)

market <- read_and_sanitize(path, sheet = "Market")
market %>% readr::write_csv("data-raw/market.csv")
# usethis::use_data(market, overwrite = TRUE)
