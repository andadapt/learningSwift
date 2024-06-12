func wordCheck(word1: String, word2: String) -> String {
    if word1.sorted() == word2.sorted() {
        return "the words match"
    }
    else {
        return "the words do not match"
    }
}

print(wordCheck(word1: "cab", word2: "abc"))
print(wordCheck(word1: "hello", word2: "woo"))