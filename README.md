# BD Smart Zip Code Extractor for Google Tag Manager

Technical documentation for the BD Smart Zip Code Extractor variable template.

## Overview

BD Smart Zip Code Extractor is a precision-engineered GTM variable template designed to ensure the presence of valid postal code data for users in Bangladesh. It utilizes a hierarchical logic system that prioritizes explicit 4-digit numeric extraction, followed by automated mapping based on recognized Upazila/Thana or District names.

## Technical Significance

Accurate postal codes are critical for platforms such as Meta (Facebook) and Google Ads to achieve high Event Match Quality. This template ensures that even when users provide incomplete address data, the tracking layer can supply the necessary geographic identifiers for better attribution and ad performance.

## Core Features

- **Numeric Extraction:** Safely extracts 4-digit numeric strings from complex address text using robust parsing logic.
- **Upazila/Thana Mapping:** Features a pre-configured database of over 100 major administrative areas (e.g., Uttara -> 1230, Mirpur -> 1216).
- **District-Level Fallback:** Provides secondary mapping for all 64 districts to ensure a valid zip code is always returned.
- **Automated Sanitation:** Handles varying delimiters such as commas, periods, and hyphens to maintain data integrity.

## Configuration Instructions

1. **Import:** Add the `template.tpl` file to the GTM Templates section.
2. **Configuration:** Create a new variable of type "BD Smart Zip Code Extractor".
3. **Input:** Map the "Full Address" field to the relevant Data Layer variable.
4. **Implementation:** Assign the resulting variable to the postal code parameter in your marketing tags.

## Logic Execution Examples

| Input Address | Processing Logic | Result |
| :--- | :--- | :--- |
| "Sector 4, Uttara, Dhaka" | Thana/Upazila Mapping | `1230` |
| "Comilla Sadar, Zip: 3500" | Explicit Extraction | `3500` |
| "Near Rail Station, Bogra" | District Fallback | `5800` |

## Technical Support and Attribution

Developed and maintained by **Md Sadikul Islam Shadin**.

For technical updates, please refer to the [official LinkedIn profile](https://www.linkedin.com/in/sadikulshadin/).
