
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
| Ashley   |  6161 |    2409 |  2.56 |
| Laura    | 18629 |    9041 |  2.06 |
| Sam      | 16559 |    8698 |  1.90 |
| Marisha  | 14176 |    8353 |  1.70 |
| Travis   | 14601 |    8626 |  1.69 |
| Liam     | 11919 |    7349 |  1.62 |
| Taliesin | 13527 |    9001 |  1.50 |

We can see that while Liam is in the bottom half, both Travis and
Taliesin have lower scores.

I also wanted to take a slightly different approach and look at for
words with either a positive or negative sentiment.

![positive vs negative](../plots/positiveNegativePlot.png)

| Name     | Negative | Positive | Ratio |
| :------- | -------: | -------: | ----: |
| Ashley   |     6327 |    12071 |  1.91 |
| Laura    |    23310 |    40183 |  1.72 |
| Sam      |    20326 |    33003 |  1.62 |
| Taliesin |    21456 |    30146 |  1.41 |
| Liam     |    19029 |    25591 |  1.34 |
| Marisha  |    23700 |    30921 |  1.30 |
| Travis   |    24143 |    30311 |  1.26 |

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
