
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
| Ashley   |  4462 |    1871 |  2.38 |
| Laura    | 16369 |    7984 |  2.05 |
| Sam      | 13880 |    7547 |  1.84 |
| Marisha  | 12230 |    7353 |  1.66 |
| Travis   | 11896 |    7213 |  1.65 |
| Liam     | 10336 |    6478 |  1.60 |
| Taliesin | 11831 |    7961 |  1.49 |

We can see that while Liam is in the bottom half, both Travis and
Taliesin have lower scores.

I also wanted to take a slightly different approach and look at for
words with either a positive or negative sentiment.

![positive vs negative](../plots/positiveNegativePlot.png)

| Name     | Negative | Positive | Ratio |
| :------- | -------: | -------: | ----: |
| Ashley   |     4883 |     8492 |  1.74 |
| Laura    |    20482 |    35397 |  1.73 |
| Sam      |    17520 |    27750 |  1.58 |
| Taliesin |    17863 |    26131 |  1.46 |
| Liam     |    16763 |    22686 |  1.35 |
| Marisha  |    20892 |    27422 |  1.31 |
| Travis   |    19952 |    25569 |  1.28 |

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
