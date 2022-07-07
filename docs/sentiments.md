
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
| Ashley   |  4225 |    1810 |  2.33 |
| Robbie   |   628 |     282 |  2.23 |
| Laura    | 16130 |    7892 |  2.04 |
| Sam      | 13651 |    7442 |  1.83 |
| Marisha  | 12032 |    7222 |  1.67 |
| Travis   | 11656 |    7118 |  1.64 |
| Liam     | 10192 |    6381 |  1.60 |
| Taliesin | 11618 |    7838 |  1.48 |

We can see that while Liam is in the bottom half, both Travis and
Taliesin have lower scores.

I also wanted to take a slightly different approach and look at for
words with either a positive or negative sentiment.

![positive vs negative](../plots/positiveNegativePlot.png)

| Name     | Negative | Positive | Ratio |
| :------- | -------: | -------: | ----: |
| Laura    |    20221 |    34893 |  1.73 |
| Ashley   |     4730 |     8026 |  1.70 |
| Robbie   |      798 |     1327 |  1.66 |
| Sam      |    17277 |    27254 |  1.58 |
| Taliesin |    17431 |    25631 |  1.47 |
| Liam     |    16531 |    22403 |  1.36 |
| Marisha  |    20544 |    26975 |  1.31 |
| Travis   |    19607 |    25158 |  1.28 |

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
