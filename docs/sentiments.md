
### Does Liam play the saddest bois? A word sentiment analysis of cast dialogue

Liam has a reputation for playing sad characters, but is this deserved?
Does his dialogue contain more sad words than the rest of the cast?

To answer this I searched the dialogue from the show for words
associated with a sad sentiment, and words associated with joy as a
control. I then calculated the ratio of joyful to sad words for each
cast member and plotted it.

![joyful vs sad](../plots/joySadPlot.png)

| Name     |   Joy | Sadness | Ratio |
| :------- | ----: | ------: | ----: |
| Ashley   |  4161 |    1794 |  2.32 |
| Robbie   |   628 |     282 |  2.23 |
| Laura    | 16063 |    7871 |  2.04 |
| Sam      | 13595 |    7418 |  1.83 |
| Marisha  | 11963 |    7186 |  1.66 |
| Travis   | 11610 |    7081 |  1.64 |
| Liam     | 10143 |    6360 |  1.59 |
| Taliesin | 11569 |    7806 |  1.48 |

We can see that while Liam is in the bottom half, both Travis and
Taliesin have lower scores.

I also wanted to take a slightly different approach and look at for
words with either a positive or negative sentiment.

![positive vs negative](../plots/positiveNegativePlot.png)

| Name     | Negative | Positive | Ratio |
| :------- | -------: | -------: | ----: |
| Laura    |    20147 |    34732 |  1.72 |
| Ashley   |     4683 |     7900 |  1.69 |
| Robbie   |      798 |     1327 |  1.66 |
| Sam      |    17217 |    27112 |  1.57 |
| Taliesin |    17347 |    25513 |  1.47 |
| Liam     |    16493 |    22330 |  1.35 |
| Marisha  |    20456 |    26824 |  1.31 |
| Travis   |    19519 |    25083 |  1.29 |

Again Liam is near the bottom, but Travis still has a lower score.

-----

### References for lexicons

Hu, M., & Liu, B. (2004). Mining and summarizing customer reviews.
Proceedings of the 2004 ACM SIGKDD International Conference on Knowledge
Discovery and Data Mining - KDD ’04, 168.
<https://doi.org/10.1145/1014052.1014073>

Mohammad, S. M., & Turney, P. D. (2013). Crowdsourcing a Word–Emotion
Association Lexicon. Computational Intelligence, 29(3), 436–465.
<https://doi.org/10.1111/j.1467-8640.2012.00460.x>

Nielsen, F. Å. (2011). A new ANEW: Evaluation of a word list for
sentiment analysis in microblogs. ArXiv:1103.2903 \[Cs\].
<http://arxiv.org/abs/1103.2903>
