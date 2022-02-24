
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
| Ashley   |  3763 |    1669 |  2.25 |
| Robbie   |   628 |     282 |  2.23 |
| Laura    | 15358 |    7538 |  2.04 |
| Sam      | 12907 |    7111 |  1.82 |
| Marisha  | 11396 |    6903 |  1.65 |
| Travis   | 10924 |    6689 |  1.63 |
| Liam     |  9770 |    6139 |  1.59 |
| Taliesin | 10984 |    7485 |  1.47 |

We can see that while Liam is in the bottom half, both Travis and
Taliesin have lower scores.

I also wanted to take a slightly different approach and look at for
words with either a positive or negative sentiment.

![positive vs negative](../plots/positiveNegativePlot.png)

| Name     | Negative | Positive | Ratio |
| :------- | -------: | -------: | ----: |
| Laura    |    19411 |    33217 |  1.71 |
| Ashley   |     4363 |     7259 |  1.66 |
| Robbie   |      798 |     1327 |  1.66 |
| Sam      |    16551 |    25707 |  1.55 |
| Taliesin |    16285 |    24201 |  1.49 |
| Liam     |    15888 |    21554 |  1.36 |
| Marisha  |    19619 |    25699 |  1.31 |
| Travis   |    18517 |    23887 |  1.29 |

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
