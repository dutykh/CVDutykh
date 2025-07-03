#!/usr/bin/env python3
"""
Test the URL fixing functionality in extract_cv.py
"""

from extract_cv import fix_urls_in_content

# Test cases
test_cases = [
    # (input, expected_output, description)
    (
        r"\href{www.example.com/}{Example}",
        r"\href{https://www.example.com/}{Example}",
        "Basic URL without protocol"
    ),
    (
        r"\href{https://www.example.com/}{Example}",
        r"\href{https://www.example.com/}{Example}",
        "URL already has https"
    ),
    (
        r"\href{http://www.example.com/}{Example}",
        r"\href{http://www.example.com/}{Example}",
        "URL already has http"
    ),
    (
        r"\href{mailto:test@example.com}{Email}",
        r"\href{mailto:test@example.com}{Email}",
        "Mailto link unchanged"
    ),
    (
        r"\href{#section1}{Section}",
        r"\href{#section1}{Section}",
        "Internal reference unchanged"
    ),
    (
        r"\href{./file.pdf}{Local file}",
        r"\href{./file.pdf}{Local file}",
        "Local file reference unchanged"
    ),
    (
        r"\href{www.ams.org/}{AMS} and \href{example.com}{Example}",
        r"\href{https://www.ams.org/}{AMS} and \href{https://example.com}{Example}",
        "Multiple URLs in one line"
    )
]

print("Testing URL fixing functionality...\n")

all_passed = True
for input_text, expected, description in test_cases:
    result = fix_urls_in_content(input_text)
    passed = result == expected
    all_passed &= passed
    
    status = "✓ PASS" if passed else "✗ FAIL"
    print(f"{status} - {description}")
    if not passed:
        print(f"  Input:    {input_text}")
        print(f"  Expected: {expected}")
        print(f"  Got:      {result}")
    print()

if all_passed:
    print("All tests passed!")
else:
    print("Some tests failed!")