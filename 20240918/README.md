### Word Ladder Problem (Transforming Words with BFS)

Given two words, `beginWord` and `endWord`, and a dictionary `wordList`, find the length of the shortest transformation sequence from `beginWord` to `endWord`, such that:

1. Only one letter can be changed at a time.
2. Each transformed word must exist in the word list.

Return 0 if no transformation is possible.

#### Example:
Input: `beginWord = "hit"`, `endWord = "cog"`, `wordList = ["hot","dot","dog","lot","log","cog"]`
Output: `5` (The transformation is "hit" -> "hot" -> "dot" -> "dog" -> "cog")
