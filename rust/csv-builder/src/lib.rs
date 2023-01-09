pub struct CsvRecordBuilder {
    content: String,
}

impl CsvRecordBuilder {
    // Create a new builder
    pub fn new() -> Self {
        CsvRecordBuilder { content: String::from("") }
    }

    /// Adds an item to the list separated by a space and a comma.
    pub fn add(&mut self, val: &str) {
        if !self.content.is_empty() {
            self.content += ","
        }

        if val.contains(',') || val.contains('\n') || val.contains('"') {
            self.content += format!("\"{}\"", val.replace("\"","\"\"")).as_str();
        } else {
            self.content += val
        }
    }

    /// Consumes the builder and returns the comma separated list
    pub fn build(self) -> String {
        self.content
    }
}
