#!/bin/bash

SOURCE="$1"
TARGET="$2"
OUTPUT="report.md"

# 临时清洗后的文件
CLEAN_SOURCE="__clean_source.md"
CLEAN_TARGET="__clean_target.md"

# Step 0: Clean UTF-8 and invisible characters
# 删除 BOM、U+200B、U+FEFF、U+00A0 等不可见字符
iconv -f utf-8 -t utf-8 -c "$SOURCE" | sed 's/\xE2\x80\x8B//g; s/\xEF\xBB\xBF//g; s/\xC2\xA0/ /g' > "$CLEAN_SOURCE"
iconv -f utf-8 -t utf-8 -c "$TARGET" | sed 's/\xE2\x80\x8B//g; s/\xEF\xBB\xBF//g; s/\xC2\xA0/ /g' > "$CLEAN_TARGET"

# Step 1: Remove TOC lines (e.g., markdown links like - [Title](#link))
# Step 2: Keep content up to '# Findings', discard everything after
# Step 3: Insert clean_source.md after '# Findings'

awk -v insert_file="$CLEAN_SOURCE" 'BEGIN { found = 0 }
    /^-  \[.*\] \(.*\)/ { next }  # Skip TOC lines
    {
        print $0
        if ($0 ~ /^# Findings$/ && !found) {
            found = 1
            while ((getline line < insert_file) > 0) {
                print line
            }
            close(insert_file)
            exit
        }
    }
' "$CLEAN_TARGET" > "$OUTPUT"

# Step 4: Clean up temp files
rm -f "$CLEAN_SOURCE" "$CLEAN_TARGET"

echo "✅ Cleaned and updated report written to $OUTPUT"
