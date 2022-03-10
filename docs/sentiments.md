
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
| Ashley   |  3814 |    1691 |  2.26 |
| Robbie   |   628 |     282 |  2.23 |
| Laura    | 15454 |    7586 |  2.04 |
| Sam      | 13008 |    7151 |  1.82 |
| Marisha  | 11470 |    6935 |  1.65 |
| Travis   | 11000 |    6743 |  1.63 |
| Liam     |  9812 |    6159 |  1.59 |
| Taliesin | 11032 |    7510 |  1.47 |

We can see that while Liam is in the bottom half, both Travis and
Taliesin have lower scores.

I also wanted to take a slightly different approach and look at for
words with either a positive or negative sentiment.

![positive vs negative](../plots/positiveNegativePlot.png)

| Name     | Negative | Positive | Ratio |
| :------- | -------: | -------: | ----: |
| Laura    |    19533 |    33443 |  1.71 |
| Robbie   |      798 |     1327 |  1.66 |
| Ashley   |     4424 |     7343 |  1.66 |
| Sam      |    16646 |    25898 |  1.56 |
| Taliesin |    16397 |    24325 |  1.48 |
| Liam     |    15961 |    21648 |  1.36 |
| Marisha  |    19722 |    25866 |  1.31 |
| Travis   |    18651 |    24018 |  1.29 |

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
